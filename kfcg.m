function clust=kfcg(D,itr)
global numFramesWritten11;
D=transpose(D);
Y=cell(power(2,itr),1);
A=cell(power(2,itr+1)-1,1);
A{1}=D(1,:);
l=1;

for i=0:itr-1
    for j=1:power(2,i)
        l=l+1;
        n1=l;
        p=floor(l/2);
        C1=1.1*mean(A{p}); 
        l=l+1;
        C2=0.9*mean(A{p}); n2=l;
        m=1; n=1;
        for k=1:length(A{p})
            b=A{p,1}(1,k);
            if abs(b-C1)>abs(b-C2)
                A{n1,1}(1,n)=b;
                n=n+1;
            else
                A{n2,1}(1,m)=b;    
                m=m+1;
            end
        end
    end
end

q=power(2,itr);
for j=1:q
    Y{q-j+1}=A{l};
   l=l-1;
end

Y = Y(~cellfun(@isempty, Y));
col=numel(Y);
row=numFramesWritten11-1;
clust=zeros(row,col);
for i=1:col
    for j=1:row
     if j<=length(Y{i})
         clust(j,i)=Y{i,1}(1,j);
     end
    end
end

