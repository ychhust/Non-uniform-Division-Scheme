function extentpoint_power=Scene_power(place_start,place_end,x)
%   �﷨��
%   extentpoint_power=Scene_power(x)
% 
%   �������ܣ�
%   �˺���Ϊ�������·ֲ�ģ�飬����Ϊ��
%   ��ȡ������������յ���Ϣ�����������������Ϣ��

%% �������Ա仯
    if((x>=place_start(1))&&(x<place_end(1)))
    %         extentpoint_power=50/sqrt(1-x^2);
        extentpoint_power=(100+1.5*sin(10*pi*(x-place_end(1))));
    %          extentpoint_power=(50+sin(5*pi*x));
    %         extentpoint_power=awgn(extentpoint_power,120,'measured');
    % extentpoint_power=50;
    else if((x>=place_start(2))&&(x<place_end(2)))
         extentpoint_power=(100+(200+(x-place_end(2))^2*(-20000)));
        %             extentpoint_power=awgn(extentpoint_power,120,'measured');
        else if((x>=place_start(3))&&(x<place_end(3)))
                extentpoint_power=(300+2*sin(10*pi*(x-place_start(3))));
            % extentpoint_power=(250)/sqrt(1-x^2);
            %                 extentpoint_power=awgn(extentpoint_power,120,'measured');
            else if((x>=place_start(4))&&(x<place_end(4)))
                    extentpoint_power=(300+(x-place_start(4))*(-2000));
                %                     extentpoint_power=awgn(extentpoint_power,120,'measured');
                else 
                        extentpoint_power=(100+1.5*sin(10*pi*(x-place_start(5))));
                    %                     extentpoint_power=(50)/sqrt(1-x^2);
                    %                     extentpoint_power=awgn(extentpoint_power,120,'measured');
                
                end
            end
        end
    end
%     extentpoint_power=awgn(extentpoint_power,40,'measured');
%% ��������͹����͹�仯           
%     if(x<place_start(1))
%         extentpoint_power=50/sqrt(1-x^2);
%     else if((x>=place_start(1))&&(x<place_end(1)))
%             extentpoint_power=(250+(x+0.3)^2*(-20000))/sqrt(1-x^2);
%         else if((x>=place_start(2))&&(x<place_end(2)))
%                 extentpoint_power=250/sqrt(1-x^2);
%             else if((x>=place_start(3))&&(x<place_end(3)))
%                     extentpoint_power=(50+(x-0.3)^2*20000)/sqrt(1-x^2);
%                 else
%                     extentpoint_power=50/sqrt(1-x^2);
%                 end
%             end
%         end
%     end
%%  ������͹�����仯
%     if(x<place_start(1))
%             extentpoint_power=50/sqrt(1-x^2);
%         else if((x>=place_start(1))&&(x<place_end(1)))
%                 extentpoint_power=(250+(x+0.3)^2*(-20000))/sqrt(1-x^2);
%             else if((x>=place_start(2))&&(x<place_end(2)))
%                     extentpoint_power=250/sqrt(1-x^2);
%                 else if((x>=place_start(3))&&(x<place_end(3)))
%                         extentpoint_power=(250-(x-0.2)^2*20000)/sqrt(1-x^2);
%                     else
%                         extentpoint_power=50/sqrt(1-x^2);
%                     end
%                 end
%             end
%     end
%% ������͹�����仯
%     if(x<place_start(1))
%             extentpoint_power=50/sqrt(1-x^2);
%         else if((x>=place_start(1))&&(x<place_end(1)))
%                 extentpoint_power=(50+(x+0.4)^2*20000)/sqrt(1-x^2);
%             else if((x>=place_start(2))&&(x<place_end(2)))
%                     extentpoint_power=250/sqrt(1-x^2);
%                 else if((x>=place_start(3))&&(x<place_end(3)))
%                         extentpoint_power=(50+(x-0.3)^2*20000)/sqrt(1-x^2);
%                     else
%                         extentpoint_power=50/sqrt(1-x^2);
%                     end
%                 end
%             end
%     end    
