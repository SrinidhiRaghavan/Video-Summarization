global FileName mov
toc;
f = figure('Visible','off');
FileName=strcat('C:\VideoSumm\',FileName);
mov2=VideoReader(FileName);
a=strcat('Processing time :',num2str(toc));
b=strcat('Orginal Length :',num2str(mov.duration));
c=strcat('Summmarized Length :',num2str(mov2.duration));
S=sprintf('%s\n%s\n%s',a,b,c);
eh = uicontrol('Style','text',...
    'Position',[200 205 150 50],...
    'String',S);
set(f,'Visible','on');