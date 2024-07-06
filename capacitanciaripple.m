clear; clc; close all
Vin = 5;       
D = 0.66;       
L = 500e-6;    
f_sw = 18e3;  
R_load = 33;    
I_load = Vin * D / R_load; 

Vout = D * Vin;       
Delta_I_L = (Vin - Vout) * D / (L * f_sw);

C_values = 1e-6:1e-6:100e-6; 

Voltage_ripple = zeros(size(C_values));

for i = 1:length(C_values)
    C = C_values(i);
    Delta_V = Delta_I_L / (8 * f_sw * C);
    Voltage_ripple(i) = Delta_V;
end

figure;
plot(C_values * 1e6, Voltage_ripple, 'b-', 'LineWidth', 2);
xlabel('Capacitância (\muF)');
ylabel('Voltage Ripple (V)');
title('Voltage Ripple em função da capacitância');
grid on;
