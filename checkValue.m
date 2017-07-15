function pos=checkValue(value,n,f)
pos=0;
for i=1:n
    if f(i).hist==value
        pos=i;
       break;
    end
end