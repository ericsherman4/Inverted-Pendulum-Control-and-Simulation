M = .5;
m = 0.2;
b = 0.1;
g = -9.8;
l = 0.35;
I = m*((l*2)^2)/3

% M = 1;
% m = 1;
% b = 1;
% l = 20;
% I = m*(l^2)/3;
% g = 9.8;


p = I*(M+m)+M*m*l^2; %denominator for the A and B matrices

A = [0      1              0           0;
     0 -(I+m*l^2)*b/p  (m^2*g*l^2)/p   0;
     0      0              0           1;
     0 -(m*l*b)/p       m*g*l*(M+m)/p  0];
B = [     0;
     (I+m*l^2)/p;
          0;
        m*l/p];
C = [1 0 0 0;
     0 0 1 0];

D = [0;
     0];

states = {'x' 'x_dot' 'phi' 'phi_dot'};
inputs = {'u'};
outputs = {'x'; 'phi'};

sys_ss = ss(A,B,C,D,'statename',states,'inputname',inputs,'outputname',outputs)
sys_tf = tf(sys_ss)

sys_tf_1 = tf(cell2mat(sys_tf.Numerator(1)), cell2mat(sys_tf.Denominator(1)))
sys_tf_2 = tf(cell2mat(sys_tf.Numerator(2)), cell2mat(sys_tf.Denominator(2)))

isstable(sys_tf_1)
isstable(sys_tf_2)

roots(cell2mat(sys_tf_1.Denominator))
roots(cell2mat(sys_tf_2.Denominator))

Q = [1 0 0 0; 0 1 0 0; 0 0 10 0; 0 0 0 100]
R = 0.001

k = lqr(A,B,Q,R)

eig(A-B*k)



