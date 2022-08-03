import os
import sys
import time
import re
import math
import pandas as pd
from natsort import ns, natsorted

def my_log(info, over_write=False):
    log_string = time.asctime() + " " +info+"\n"
    print(log_string)

    try:
        if over_write:
            with open('compare_excel_data_log.txt', 'w') as f:
                f.write(log_string)
                f.close()
        else:
            with open('compare_excel_data_log.txt', 'a+') as f:
                f.write(log_string)
                f.close()
    except Exception as e:
        print('写入错误日志时发生以下错误：\n%s'%e)

def is_number(s):
    try:
        float(s)
        if(float(s)!=float(s)):
            return False
        else :
            return True
    except ValueError:
        pass
    return False

def to_float(s):
    if is_number(s):
        return float(s)
    else:
        return -100000.0

def dataframes_compare(description_list,df_target,df_source):
    lineNum             = len(df_target)
    result_list_of_list = []
    for x in range(len(df_target)):
        list_target_raw =   df_target.iloc[x].tolist()
        list_source_raw =   df_source.iloc[x].tolist()
        list_target_later_part  = list_target_raw[1:]
        list_source_pre_part    = list_source_raw[:len(list_source_raw) - 1]
        list_source_later_part  = list_source_raw[1:]

        result_list =   []
        for (target_later_item,source_pre_item,source_later_item) in zip(list_target_later_part,
                                                                         list_source_pre_part,
                                                                         list_source_later_part):
            result_item =   to_float(target_later_item) - (to_float(source_later_item) - to_float(source_pre_item))
            if (math.fabs(result_item) > 10000):
                my_log("something wrong,please check the file format!!!")
                time.sleep(1)
                sys.exit(1)
            result_list.append(result_item)
        result_list_of_list.append(result_list)

    result_list_of_list.insert(0,description_list)
    result_list_of_list.append(["end ", "---"])

    df_result   = pd.DataFrame(result_list_of_list)
    return df_result

def compare_single_file(TargetSingleFile,SourceSingleFile):
    #define target/source/temp file:  path,full name,short name,basename and ext
    my_log("info:start to compare: " + TargetSingleFile + "  and  " + SourceSingleFile)
    dir_path = os.getcwd()
    target_file_path            = os.path.join(dir_path,"pureraw")
    source_file_path            = os.path.join(dir_path,"rawdata")
    temp_file_path              = os.path.join(dir_path,"Temp Files")
    target_file_full_name       = os.path.join(target_file_path,TargetSingleFile)
    target_file_basename,ext    = os.path.splitext(os.path.basename(TargetSingleFile))
    target_xlsx_full_file_name  = os.path.join(temp_file_path,target_file_basename + ".xlsx")
    source_file_full_name       = os.path.join(source_file_path, SourceSingleFile)
    source_file_basename, ext   = os.path.splitext(os.path.basename(SourceSingleFile))
    source_xlsx_full_file_name  = os.path.join(temp_file_path, source_file_basename + ".xlsx")

    # read from csv, translate, and write into xlsx; df mean data frame
    df_target   = pd.read_csv(target_file_full_name,sep=",")
    df_source   = pd.read_csv(source_file_full_name,sep=",")
    df_target.to_excel(target_xlsx_full_file_name)
    df_source.to_excel(source_xlsx_full_file_name)
    df_target   = pd.read_excel(target_xlsx_full_file_name)
    df_source   = pd.read_excel(source_xlsx_full_file_name)

    #compare process, detail from Kp; 3 sections
    description_list    =   [TargetSingleFile,"MRN[0]","MRN0[0]",SourceSingleFile]
    df_target_section1  =   df_target.iloc[1:17,1:37]
    df_source_section1  =   df_source.iloc[1:17,1:37]
    df_result_section1  =   dataframes_compare(description_list,
                                               df_target_section1.reset_index(drop=True),
                                               df_source_section1.reset_index(drop=True))

    description_list    =   [TargetSingleFile, "MRN[1]", "MRN1[0]", SourceSingleFile]
    df_target_section2  =   df_target.iloc[19:35, 1:37]
    df_source_section2  =   df_source.iloc[91:107, 1:37]
    df_result_section2  =   dataframes_compare(description_list,
                                               df_target_section2.reset_index(drop=True),
                                               df_source_section2.reset_index(drop=True))

    description_list    =   [TargetSingleFile, "MRN[2]", "MRN2[0]", SourceSingleFile]
    df_target_section3  =   df_target.iloc[37:53, 1:37]
    df_source_section3  =   df_source.iloc[181:197, 1:37]
    df_result_section3  =   dataframes_compare(description_list,
                                               df_target_section3.reset_index(drop=True),
                                               df_source_section3.reset_index(drop=True))

    df_result_single_file_all   =   df_result_section1.append(df_result_section2)
    df_result_single_file_all   =   df_result_single_file_all.append(df_result_section3)
    return df_result_single_file_all

def compare_files(TargetFilesArray,SourceFilesArray):
    df_result_all   = pd.DataFrame()
    for (TargeSingleFile,SourceSingleFile) in zip(TargetFilesArray,SourceFilesArray):
        df_result_all = df_result_all.append(compare_single_file(TargeSingleFile,SourceSingleFile))
    return df_result_all

def compare_func():
    # get current work path; prepare for target & source files list which include path; and sorted
    dir_path                = os.getcwd()
    target_path             = os.path.join(dir_path, "pureraw")
    target_files_unsorted   = []
    for item in os.listdir(target_path):
        if os.path.isfile(os.path.join(target_path, item)):
            target_files_unsorted.append(item)
    target_files            = natsorted(target_files_unsorted, alg=ns.PATH)
    print(target_files)

    source_path             = os.path.join(dir_path, "rawdata")
    source_files_unsorted   = []
    for item in os.listdir(source_path):
        if os.path.isfile(os.path.join(source_path, item)):
            source_files_unsorted.append(item)
    source_files            = natsorted(source_files_unsorted, alg=ns.PATH)
    print(source_files)

    # check if the length of file name lists are same
    if len(target_files) != len(source_files):
        my_log("Error: the count of pureraw files is not same with the count of rawdata files!")
        sys.exit(1)

    # prepare output dir and file
    output_path         = os.path.join(dir_path, "output_files")
    output_filename     = os.path.join(output_path,"compare_resluts.xlsx")

    #compare pureraw and rawdata by KP logic and output compare result. df mean dataframe
    df_result           = compare_files(target_files, source_files)
    df_result.to_excel(output_filename)

if __name__ == '__main__':
    my_log("Start to compare the data in files ...", True)

    # check if the dir pureraw is ok
    if not os.path.exists("pureraw"):
        error_msg = "error: pureraw dir is not found, please check!"
        my_log(error_msg)
        sys.exit(1)

    # check if the dir rawdata is ok
    if not os.path.exists("rawdata"):
        error_msg = "error: rawdata dir is not found, please check!"
        my_log(error_msg)
        sys.exit(1)

    # csv格式文件有点问题，需要中转为xlsx文件来进行比较；创建Temp Files目录来中转处理；
    if not os.path.exists("Temp Files"):
        try:
            os.mkdir("Temp Files")
        except Exception as e:
            my_log(e)
            sys.exit(1)

    if not os.path.exists("output_files"):
        try:
            os.mkdir("output_files")
        except Exception as e:
            my_log(e)
            sys.exit(1)
    try:
        compare_func()
    except Exception as e:
        my_log('Exception ：compare_func \n%s' % e)
        sys.exit(1)
    my_log("Finished! Everthing is ok.")
    sys.exit(0)
