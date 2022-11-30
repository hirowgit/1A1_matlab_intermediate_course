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
% # @Time    : 2022-11-30 
% # @Author  : Hiroaki Wagatsuma
% # @Site    : https://github.com/hirowgit/1A1_matlab_intermediate_course
% # @IDE     : MATLAB R2022a
% # @File    : lec4_step1_bar_FillLine_Plus.m


% prFill=ASnum/NboxInLine;
% ラインのどのくらい使うか
prFill=[90    60    50    50    50    90    40    30    80    40  20 ]/100;


% ラインが使われたか？未処理か？フラグ
fillLine=boolean(ones(1,size(prFill,2)));
LineT={};
k=1;
for i=1:size(prFill,2)
    if fillLine(i)
        remF=1-prFill(i);
        IDrem=find(prFill(i+1:end)<=remF & fillLine(i+1:end));
        tmp=i; j=1; fID=i;
        while ~isempty(IDrem)
            fID=IDrem(1)+fID;
            tmp(end+1)=fID;
            remF=remF-prFill(IDrem(j)+i);
            IDrem=find(prFill(fID+1:end)<=remF & fillLine(fID+1:end));      
        end
        LineT{k}=tmp;
        fillLine(tmp)=false;
        k=k+1;
    end
end

lenLineT=cell2mat(cellfun(@(x) length(x),LineT,'UniformOutput',false));
stackBarD=zeros(size(LineT,2),max(lenLineT));

for i=1:length(LineT)
    tmp=LineT{i};
    stackBarD(i,1:length(tmp))=prFill(tmp);
end

figure(1);clf;
subplot(2,1,1);
barOri = bar(prFill,'FaceColor','flat','LineWidth',2);
barOri.CData = [1 1 1];
xlabel('store ID');
ylabel('Action Steps (AS)');
set(gca,'FontSize',12);
grid on;

for i = 1:size(prFill,2)  % Line ID (horizontal)
    ypos=prFill(i)./2;
    text(i-0.03-0.1,0.035+ypos,num2str(i));
    text(i-0.15-0.1,0.035+ypos-0.07,[num2str(prFill(i)*100),'%']);
            
   
end

subplot(2,1,2);
barS = bar(stackBarD,'stacked','FaceColor','flat','LineWidth',2),hold on;
bsLabel=num2cell(1:size(LineT,2));
bsLabel2=cellfun(@(x) ['L',num2str(x)],bsLabel,'UniformOutput',false);
xticklabels(bsLabel2);
for i = 1:size(stackBarD,2)
    barS(i).CData = [1 1 1];
end
xlabel('Line ID');
ylabel('Action Steps (AS)');
set(gca,'FontSize',12);

for i = 1:size(stackBarD,1)  % Line ID (horizontal)
    baseY=0;
    for j = 1:size(stackBarD,2) % stacked  (vertical)
        if  stackBarD(i,j)>0
            key=LineT{i}(j); tmp=prFill(key);
            ypos=tmp/2;
            text(i-0.03,0.035+baseY+ypos,num2str(key));
            text(i-0.15,0.035+baseY+ypos-0.07,[num2str(tmp*100),'%']);
            baseY=baseY+tmp;
        end
    end
end


% k=1;
% for i = 1:size(stackBarD,2)
%     for j = 1:size(stackBarD,1)
% %         barS(i,j).CData = k;
%         barS(i).CData = [1 1 1];
%         k=k+1;
%     end
% end

