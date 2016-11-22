function [extentpoint_place_start,extentpoint_place_end,num]=STMParaDef1D()
    
    extentpoint_place_start = [-0.7 -0.4 -0.3 0.3 0.4];       %来波方向起始位置
    extentpoint_place_end = [ -0.4 -0.3 0.3 0.4 0.5];       %来波方向终止位置
    num=length(extentpoint_place_start);