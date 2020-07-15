clear, clf, hold off
m = 1000000; veces = 50;
ax = -3; bx  = 3;
ay = -3; by  = 3;
az = -3; bz  = 3; 
sa = 0; saa = 0;
for k=1:veces
    n=0;
    for i=1:m
        r = rand; x = ax + (bx-ax)*r;
        r = rand; y = ay + (by-ay)*r;
        r = rand; z = az + (bz-az)*r;
        if (sin(x)*(cos(y-pi)))<z && z <= 0&& (x>=0&&x<=pi) && (y>=0&&y<=(pi/2))
            n     = n+1;
            px(n) = x; 
            py(n) = y;
            pz(n) = z;
        end
    end
    volumen = n*(by-ay)*(bx-ax)*(bz-az)/m;
    sa   = sa + volumen;
    saa  = saa + volumen^2;
end
prom = sa/veces;
desv = sqrt(veces*saa-sa^2)/veces;
promedio = num2str(prom);
desviacion = num2str(desv);
plot3(px,py,pz,'.'),
title('Áreas por el metodo MonteCarlo') 
xlabel('x');
ylabel('y');
zlabel('z');
axis equal;
axis ([ax-0.1,bx+0.1,ay-0.1,by+0.1,az-0.1,bz+0.1]);
text(ax/2+bx/2,by-0.25+bz-0.25,promedio);
text(ax/2+bx/2,by-0.50+bz-0.25,'+-');
text(ax/2+bx/2,by-0.75+bz-0.25,desviacion);