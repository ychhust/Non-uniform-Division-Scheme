function [ant_num,div,min_spacing,T_rec]=SystemParaDef_2D()

    array_type = 'Cross_shape'; %�����Ų����͡�  *AntennaPositionHELP()        
    ant_num = 72;% ��Ԫ��                
    div =(3:80)*20;%�ռ�theta�ǶȲ����Ȼ���
    min_spacing =0.8;% ��С��ࡢ�������з�ʽ��λΪ������  
    T_rec = 300;%���ջ��¶ȣ���TB����λ��K
    %�����ɼ��Ⱥ����뻮�ֵ�����ϵʱ��ѭ������