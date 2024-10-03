% Author: Emma Eady / eke0016@auburn.edu
% Date: 2024-09-01
% Assignment Name: hw02

classdef hw02
    methods (Static)

        function [c, n] = p1(f, a, b, epsilon, name, f_prime)
            % p1: Implement numerical methods to find the root of a function
            % :param f: function handle
            % :param a: real number, the left end of the interval
            % :param b: real number, the right end of the interval
            % :param epsilon: real number, the function tolerance
            % :param name: string, the name of the method
            % :param f_prime: function handle, the derivative of the function, only needed for Newton's method
            %
            % :return: 
            % c: real number, the root of the function
            % n: integer, the number of iterations
            if strcmp(name, 'bisection')
                n = 0;
                c = (a + b) / 2;
                while abs(f(c)) > epsilon
                    if f(a) * f(c) < 0
                        b = c;
                    else
                        a = c;
                    end
                    c = (a + b) / 2;
                    n = n + 1;
                end

            elseif strcmp(name, 'secant') % secant method
                % Write your code here
                n = 0;
                while abs(b-a) > epsilon
                    c = b - f(b) * (b-a) / (f(b) - f(a));
                    a = b;
                    b = c;
                    n = n + 1;
                    if abs(f(c)) < epsilon
                        break;
                    end 
                end

            elseif strcmp(name, 'newton') % Newton's method
                % Write your code here
                n = 0;
                c = b; % Initial guess
                while abs (f(c)) > epsilon
                    c = c - f(c) / f_prime(c); 
                    n = n + 1;
                    
                end

            elseif strcmp(name, 'regula_falsi') % false position method
                % Write your code here
                n = 0;
                while abs(b - a) > epsilon
                    c = a - f(a) * (b - a) / (f(b) - f(a));
                    if abs(f(c)) < epsilon
                        break;
                    end
                    if f(a) * f(c) < 0
                        b = c;
                    else
                        a = c;
                    end
                    n = n + 1;
                end

            elseif strcmp(name, 'steffensen') % Steffensen's method
                % Write your code here
                n = 0;
                c = a;
                while abs(f(c)) > epsilon
                    f_c = f(c);
                    c = c - f_c^2 / (f(c + f_c) - f_c);
                    n = n + 1;
                   
                end
            end
        end

        function p2()
            
        %     summarize the iteration number for each method name in the table
        
        %     |name          | iter | 
        %     |--------------|------|
        %     |bisection     | 32   |
        %     |secant        | 8    |
        %     |newton        | 6    |
        %     |regula_falsi  | 59   |
        %     |steffensen    | 13   |
            
        end
    end
end