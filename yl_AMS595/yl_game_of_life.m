clc
clear

m = 7;
n = 7;
h = 56;
t = 0.1;


advance(m,n,h,t)

function advance(m,n,h,t)
    a = zeros(m,n);
    a(3,4)=1; a(4,4)=1; a(4,6)=1;
    a(5,4)=1; a(5,5)=1;
    % Initial conditon of a glider

    for x =1:m
        for y=1:n
            if a(x,y)==1
                fx = [x-1,x-1,x,x];
                fy = [y-1,y,y,y-1];
                fill(fx,fy,'k');
                hold on
            end
        end
    end
    % plot the initial a

    for k=1:h
        fx = [0,m,m,0]; fy = [0,0,n,n]; 
        fill(fx,fy,'w'), hold on
    %     plot the white background
        for x= 2:m-1
            for y = 2:n-1
                b(x,y)=a(x-1,y-1)+a(x-1,y)+a(x-1,y+1)+a(x,y-1)+a(x,y+1)+a(x+1,y-1)+a(x+1,y)+a(x+1,y+1);
                if b(x,y)==2, c(x,y)=a(x,y);
                elseif b(x,y)==3,c(x,y)=1;
                else c(x,y)=0;
                end
            end
        end
        for x = 1:1
            for y=2:n-1
                b(x,y)=a(m,y-1)+a(m,y)+a(m,y+1)+a(x,y-1)+a(x,y+1)+a(x+1,y-1)+a(x+1,y)+a(x+1,y+1);
                if b(x,y)==2, c(x,y)=a(x,y);
                elseif b(x,y)==3,c(x,y)=1;
                else c(x,y)=0;
                end
            end
            for y= 1:1
                b(x,y)=a(m,n)+a(m,y)+a(m,y+1)+a(x,n)+a(x,y+1)+a(x+1,n)+a(x+1,y)+a(x+1,y+1);
                if b(x,y)==2, c(x,y)=a(x,y);
                elseif b(x,y)==3,c(x,y)=1;
                else c(x,y)=0;
                end
            end
            for y= n:n
                b(x,y)=a(m,y-1)+a(m,y)+a(m,1)+a(x,y-1)+a(x,1)+a(x+1,y-1)+a(x+1,y)+a(x+1,1);
                if b(x,y)==2, c(x,y)=a(x,y);
                elseif b(x,y)==3,c(x,y)=1;
                else c(x,y)=0;
                end
            end
        end

        for x = m:m
            for y=2:n-1
                b(x,y)=a(x-1,y-1)+a(x-1,y)+a(x-1,y+1)+a(x,y-1)+a(x,y+1)+a(1,y-1)+a(1,y)+a(1,y+1);
                if b(x,y)==2, c(x,y)=a(x,y);
                elseif b(x,y)==3,c(x,y)=1;
                else c(x,y)=0;
                end
            end
            for y=1
                b(x,y)=a(x-1,n)+a(x-1,y)+a(x-1,y+1)+a(x,n)+a(x,y+1)+a(1,n)+a(1,y)+a(1,y+1);
                if b(x,y)==2, c(x,y)=a(x,y);
                elseif b(x,y)==3,c(x,y)=1;
                else c(x,y)=0;
                end
            end
            for y=n
                b(x,y)=a(x-1,y-1)+a(x-1,y)+a(x-1,1)+a(x,y-1)+a(x,1)+a(1,y-1)+a(1,y)+a(1,1);
                if b(x,y)==2, c(x,y)=a(x,y);
                elseif b(x,y)==3,c(x,y)=1;
                else c(x,y)=0;
                end
            end
        end

        for y = 1:1 
            for x= 2:m-1
                b(x,y)=a(x-1,n)+a(x-1,y)+a(x-1,y+1)+a(x,n)+a(x,y+1)+a(x+1,n)+a(x+1,y)+a(x+1,y+1);
                if b(x,y)==2, c(x,y)=a(x,y);
                elseif b(x,y)==3,c(x,y)=1;
                else c(x,y)=0;
                end
            end
        end

        for y = n:n
            for x= 2:m-1
                b(x,y)=a(x-1,y-1)+a(x-1,y)+a(x-1,1)+a(x,y-1)+a(x,1)+a(x+1,y-1)+a(x+1,y)+a(x+1,1);
                if b(x,y)==2, c(x,y)=a(x,y);
                elseif b(x,y)==3,c(x,y)=1;
                else c(x,y)=0;
                end
            end
        end
    %     c(x,y) is the next generation of a(x,y)

        for x=1:m
            for y =1:n
                if c(x,y)==1
                    fx=[x-1,x-1,x,x];fy=[y-1,y,y,y-1];fill(fx,fy,'k'),hold on
                end
            end
        end
    %     plot c(x,y)
            pause(t)
    %         Display for t seconds
            a=c;

    end
    % display h generations

end

