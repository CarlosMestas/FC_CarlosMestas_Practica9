clear, clf, hold off
m = 100000; veces = 50;
ax = -1; bx  = 5;
ay = -2; by  = 4;
sa = 0; saa = 0;
for k=1:veces
    n=0;
    for i=1:m
        r = rand; x = ax + (bx-ax)*r;
        r = rand; y = ay + (by-ay)*r;
        if (-y^2+2*x+1>=0) && (x - y - 1 <= 0)
            n     = n+1;
            px(n) = x; 
            py(n) = y;
        end
    end
    area = n*(by-ay)*(bx-ax)/m;
    sa   = sa + area;
    saa  = saa + area^2;
end
prom = sa/veces;
desv = sqrt(veces*saa-sa^2)/veces;
promedio = num2str(prom);
desviacion = num2str(desv);
plot (px,py,'.'),
title('Áreas por el metodo MonteCarlo') 
xlabel('x');
ylabel('y');
axis equal;
axis([ax-0.1,bx+0.1,ay-0.1,by+0.1])
text(ax/2+bx/2,by-0.25,promedio);
text(ax/2+bx/2,by-0.50,'+-');
text(ax/2+bx/2,by-0.75,desviacion);