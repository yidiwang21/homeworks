clear; clc;
S12 = complex(7.1485, 6.2405);

x0 = 1;

[v2,fval]=fsolve(@flow_v2,x0);

P23 = real(S12) - 1709.2;
Q23 = imag(S12) - 876.8;

S23 = complex(P23, Q23)

[v3,fval]=fsolve(@flow_v3,x0);

function F = flow_v2(x)
    S12 = complex(7.1485, 6.2405);  
    F = [
        S12 - 7.2*((7.2-x)*(1/complex(0.0412,0.0625)))
    ];
end

function F = flow_v3(x)
    S23 = complex(-1702.1, 870.5595);
    y = 1/complex(0.0412,0.0625);
    F = [
        S23 - (7.2133 - 0.0978i)*((7.2133 - 0.0978i-x)*y)
    ];
end