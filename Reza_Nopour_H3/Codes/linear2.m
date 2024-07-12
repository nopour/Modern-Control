function dqdt = linear2(q,k1,k2,m1,m2,l,g)


dqdt=[q(2);
    -k1/m1*(q(1)-q(3))-g*q(1)/l;%-k1/m1-g/l*q(1)+k1/m1*q(3);
    q(4);
    k1*(q(1)-q(3))/m2-k2/m2*q(3)-g*q(3)/l;];%k1/m2*q(1)-((k1+k2)/m2+g/l)*q(3)];
end