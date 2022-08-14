%% MATLAB programming course for beginners, supported by Wagatsuma Lab@Kyutech 
%
% /* 
% The MIT License (MIT): 
% Copyright (c) 2022 Hiroaki Wagatsuma and Wagatsuma Lab@Kyutech
% 
% Permission is hereby granted, free of charge, to any person obtaining a
% copy of this software and associated documentation files (the
% "Software"), to deal in the Software without restriction, including
% without limitation the rights to use, copy, modify, merge, publish,
% distribute, sublicense, and/or sell copies of the Software, and to permit
% persons to whom the Software is furnished to do so, subject to the
% following conditions:
% 
% The above copyright notice and this permission notice shall be included
% in all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
% NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
% DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
% OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
% USE OR OTHER DEALINGS IN THE SOFTWARE. */
%% Specifications and requirements
% # @Time    : 2022-8-10 
% # @Author  : Hiroaki Wagatsuma
% # @Site    : https://github.com/hirowgit/1A1_matlab_intermediate_course
% # @IDE     : MATLAB R2022a
% # @File    : lec1_step7.m 

%%  Main program

% a generator of the natural number sequence randomly aligned

tic
NofD=100;
% NofD=200;
% NofD=300;

setN=NofD*20;
allData=[];
for k=1:setN
    
    flag=true(1,NofD+1);
    
    DataLine=[];
    tmp=floor(rand(1,1)*NofD)+1;
    
    while sum(flag(1:NofD))>0
        if flag(tmp)
            DataLine(end+1)=tmp;
            flag(tmp)=false;
        end
        tmp=floor(rand(1,1)*NofD)+1;
    end
    allData(k,:)=DataLine;
end

% allData=allData*10;

allData_s=sort(allData);

allData_d=diff(allData_s);

[ki kj]=find(allData_d>0);

sect_id=[0 find(diff(kj)>0)' length(kj)];
sect=[sect_id(1:end-1)+1; sect_id(2:end)];
sect_eg=mat2cell(sect',ones(1,NofD),2);

% sect_node=cellfun(@(x) kj(x(1):x(2)),sect_eg,'UniformOutput',false);
sect_data=cellfun(@(x) ki(x(1):x(2)),sect_eg,'UniformOutput',false);
NofE_data=cellfun(@(x) diff([0 x' setN])/setN,sect_data,'UniformOutput',false);
NofE_data_m=cell2mat(NofE_data);

figure(1); clf;
imagesc(allData_s);

figure(2); clf;
% for k=1:NofD
%     plot(NofE_data{k},'.-'),hold on;
% end
plot(NofE_data_m','.-')
grid on;
xp=1:NofD;

set(gca,'ylim',[0 1],'ylim',[0 mean(mean(NofE_data_m))*3]);
str_lg=cellfun(@(x) ['id = ',num2str(x)],num2cell(xp),'UniformOutput',false);
legend(str_lg);
xticks(xp);

str_xtk=cellfun(@(x) ['Pr(x=',num2str(x),')'],num2cell(xp),'UniformOutput',false);
xticklabels(str_xtk);

figure(3); clf;
meanD = mean(NofE_data_m);
errD = std(NofE_data_m);
errorbar(xp,meanD,errD,'LineWidth',1.5,'MarkerSize',32);
set(gca,'xlim',[0.5 NofD+0.5],'ylim',[0 mean(meanD)*3]);
grid on;
xticks(xp);
xticklabels(str_xtk);

%% Supplementary information to publish
%
% If you want to make a pdf or html file on the code, 
% you can use the code "x_publish_each_codes.m" in the same folder. 
% Please change the file name as " this_file_tag='lec*_step*' "  
% (* will be replaced to the number of the target file). 
%
% The code "x_publish_all_codes.m" works for such a publication applying to all
% codes in the same folder (Note: "x_publish_all_codes_sub.m" should be located in the same folder).
%%
