function [ant_num,div,min_spacing,T_rec]=SystemParaDef1D()

    array_type = 'ula'; %�����Ų����͡�  *AntennaPositionHELP()        
    ant_num =30;% ��Ԫ��                
%     div =(3:60)*20;%�ռ�theta�ǶȲ����Ȼ���
    div =1000;%�ռ�theta�ǶȲ����Ȼ���
    min_spacing =0.5;% ��С��ࡢ�������з�ʽ��λΪ������  
    T_rec = 300;%���ջ��¶ȣ���TB����λ��K
    %�����ɼ��Ⱥ����뻮�ֵ�����ϵʱ��ѭ������