classdef FrameDef
    properties
    name
    hist
    flag
    end
    methods
        function fobg=FrameDef(n,h,f)
            fobg.name=n;
            fobg.hist=h;
            fobg.flag=f;
        end
    end
end
    