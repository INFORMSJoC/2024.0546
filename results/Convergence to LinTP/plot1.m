clear;
clc;

data0 = load('data0.txt');
data1 = load('data1.txt');
data11 = load('data11.txt');
data2 = load('data2.txt');
data3 = load('data3.txt');
data21 = load('data21.txt');
data31 = load('data31.txt');
data6 = load('data6.txt');
data61 = load('data61.txt');

for i = 2:4
    % LinTP
    subplot(1,3,i-1)
    x0 = data0(:,1);
    y0 = data0(:,i);
    plot(x0,y0,'-*')
    hold on
    %0.01
    x3 = data31(:,1);
    y3 = data31(:,i);
    plot(x3,y3,'-.','LineWidth',2)
    hold on
    % 0.1
    x2 = data21(:,1);
    y2 = data21(:,i);
    plot(x2,y2,'--','LineWidth',2)
    hold on
    % 0.3
    x1 = data11(:,1);
    y1 = data11(:,i);
    plot(x1,y1,':','LineWidth',2)
    hold on
    
    % 1
    x5 = data61(:,1);
    y5 = data61(:,i);
    plot(x5,y5,'LineWidth',2)

    ylim([0 1])
    %legend('LinTP','LogTP \eta =0.3','LogTP \eta =0.1','LogTP \eta =0.01', 'LogTP \eta =0.001' ...
    %   ,'Location',' Southwest' )
    xlabel('t')
    if i == 2
        ylabel('x_{12}');
    end
    if i == 3
        ylabel('x_{13}');
    end
    if i == 4
        ylabel('x_{23}');
    end
    legend('\eta=0', '\eta=0.01','\eta=0.1','\eta=0.3','\eta=1');

% 
%     t = 0:0:0;
%     set(gca,'xtick',t);
%     set(gca,'ytick',t);
end