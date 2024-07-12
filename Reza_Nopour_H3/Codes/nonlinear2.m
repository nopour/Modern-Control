function dqdt = nonlinear2(q,k1,k2,m1,m2,l,g)


dqdt=[q(2);
    -k1*(l*sin(q(1))-l*sin(q(3))*(l*cos(q(1))))/(m1*l^2)-m1*g*l*sin(q(1))/(m1*l^2);
    q(4);
    +k1*(l*sin(q(1))-l*sin(q(3))*(l*cos(q(3))))/(m2*l^2)-k2*(l*sin(q(3)))*(l*cos(q(3)))/(m2*l^2)-m2*g*l*sin(q(3))/(m2*l^2);];
end

