syms E;
c = 299792458;
mec2 = 511E3;

Fn(E) = 1/(2*pi*53*(sqrt(c^2*(1-(1/(1+(E/mec2)))^2))/c)/137/abs(1-exp(-2*pi*53*(sqrt(c^2*(1-(1/(1+(E/mec2)))^2))/c)/137))); % Fermi Function
dFn = diff(Fn);
