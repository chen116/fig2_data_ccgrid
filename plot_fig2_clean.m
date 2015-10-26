%figure 2
close all

clc
clear

% make sure they have same length in char counts
% gives vm folder names
% vms = cellstr(['rtxen-484';'  kvm-484';'  xen-484']);
vms = cellstr(['rtxen-480';'  xen-480']);
% vms = cellstr(['bare-480']);
%ratio files name under the folders above
dists = cellstr(['bimo-medium_uni-longRTXen_ratio   ';...
%dists = cellstr([
                 'uni-heavy_uni-moderate_ratio      ';...
                 'uni-medium_uni-moderate_ratio     ';...
                 'uni-light_uni-moderate_ratio      ';...
                 ]);
% distributions on x-axis
% 480, with folder name xen, rtxen, they are 8 cores
xaxis=[0.2 0.4 0.6 0.8 1.2 1.4 1.6 1.8 2.2 2.4 2.6 2.8 3.2 3.4 3.6 3.8 4.2 4.4 4.6 4.8 5.2 5.4 5.6 5.8 6.2 6.4 6.6 6.8 7.2 7.4 7.6 7.8 8];
% 484, 8 cores
%xaxis=[3.2 3.6 4.2 4.6 5.2 5.6 6.2 6.6 7.2 7.6 8];
% line, maker style
lw=[10,6,3,2];
ms=[12,10,8,6];
ls=cellstr(['-ob';'-xg';'-xm';'-^k']);


figure
for j=1:length(dists)

    schdublilty=[];
%     figure
    for i=1:length(vms)

       fid = fopen(strcat(strtrim(vms{i}),'/',dists{j}));

        tline = fgets(fid);
        suc = zeros(1,length(xaxis));
        sum = zeros(1,length(xaxis));
        util = 1;

        while ischar(tline)

            if(1==(isspace(tline)))
                util=util+1;

            elseif(ischar(tline))

                oline = strsplit(strtrim(tline));
                if (size(oline,2)>2)
                    sum(util)=sum(util)+1;
                    if(str2double(oline(3))>0)
                        suc(util)=suc(util)+1;
                    end
                end
            end
            tline = fgets(fid);
        end
        fclose(fid);

        schdublilty(i,:) = (suc./sum)';
        subplot(2,2,j);
        plot(xaxis,schdublilty(i,:),ls{i},'LineWidth',lw(i),'MarkerSize',ms(i))

        hold on

    end
    ylim([0 1.1])
    h_title=title(dists{j},'Interpreter', 'none');
    set(h_title,'FontSize',20);
    
    % update the line below correspond to the vms list above
    h_legend=legend(' RT-Xen480', ' xen480','xen484','Location','sw');
    
    set(h_legend,'FontSize',20);
    set(gca,'fontsize',15)
    xlabel('Task Utilization Distribution','FontSize',15)
    ylabel('Fraction of schedulable task sets','FontSize',15)
    grid on
    
end

%%
%figure 2
%close all

clc
clear

% make sure they have same length in char counts
% gives vm folder names
vms = cellstr(['rtxen-484';'  kvm-484';'  xen-484']);
vms = cellstr(['bare-480']);
%ratio files name under the folders above
dists = cellstr(['bimo-medium_uni-longRTXen_ratio   ';...
%dists = cellstr([
                 'uni-heavy_uni-moderate_ratio      ';...
                 'uni-medium_uni-moderate_ratio     ';...
                 'uni-light_uni-moderate_ratio      ';...
                 ]);
% distributions on x-axis
% 480, with folder name xen, rtxen, they are 8 cores
%xaxis=[0.2 0.4 0.6 0.8 1.2 1.4 1.6 1.8 2.2 2.4 2.6 2.8 3.2 3.4 3.6 3.8 4.2 4.4 4.6 4.8 5.2 5.4 5.6 5.8 6.2 6.4 6.6 6.8 7.2 7.4 7.6 7.8 8];
% 484, 8 cores
xaxis=[3.2 3.6 4.2 4.6 5.2 5.6 6.2 6.6 7.2 7.6 8];
% line, maker style
lw=[10,6,3,2];
ms=[12,10,8,6];
ls=cellstr(['-xm';'-^k';'-ob';'-xg']);


%figure
for j=1:length(dists)

    schdublilty=[];
%     figure
    for i=1:length(vms)

       fid = fopen(strcat(strtrim(vms{i}),'/',dists{j}));

        tline = fgets(fid);
        suc = zeros(1,length(xaxis));
        sum = zeros(1,length(xaxis));
        util = 1;

        while ischar(tline)

            if(1==(isspace(tline)))
                util=util+1;

            elseif(ischar(tline))

                oline = strsplit(strtrim(tline));
                if (size(oline,2)>2)
                    sum(util)=sum(util)+1;
                    if(str2double(oline(3))>0)
                        suc(util)=suc(util)+1;
                    end
                end
            end
            tline = fgets(fid);
        end
        fclose(fid);

        schdublilty(i,:) = (suc./sum)';
        subplot(2,2,j);
        plot(xaxis,schdublilty(i,:),ls{i},'LineWidth',lw(i),'MarkerSize',ms(i))

        hold on

    end
    ylim([0 1.1])
    h_title=title(dists{j},'Interpreter', 'none');
    set(h_title,'FontSize',20);
    
    % update the line below correspond to the vms list above
    h_legend=legend('rtxen480', ' xen480','bare480','Location','sw');
    
    set(h_legend,'FontSize',20);
    set(gca,'fontsize',15)
    xlabel('Task Utilization Distribution','FontSize',15)
    ylabel('Fraction of schedulable task sets','FontSize',15)
    grid on
    hold off
end

