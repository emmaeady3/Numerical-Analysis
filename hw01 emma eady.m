% Author: Emma Eady / eke0016@auburn.edu
% Date: 2024-09-01
% Assignment Name: hw01

classdef hw01
    methods (Static)

        function p1()
            % This function only contains comments. Fill the following table. Do not write any code here.
            % :return: no returns

            % Write your result and explanation for each command here.
            % 
            % commands         |  results      | explanations
            % -----------------|---------------|-----------------------------------
            % eps              | 2.2204e-16    | it returned the distance from 1.0 to the next largest double precision number (2)                                               
            % realmax          | 1.7977e+308   | returned the largest finite floating point number in IEEE double precision 
            % realmin          | 2.2251e-308   | returned the smallest positive normalized floating point number in IEEE double precision
            % 1 + eps - 1      | 2.2204e-16    | it returned the original value of eps because 1-1 = 0 
            % 1 + eps/2 - 1    | 0             | eps divided by 2 is so small that it cannot be represneted in floating point. This leaves 1-1 = 0
            % realmin/1e10     | 2.2251e-318   | it returned an extremely small number that is denormalized because it is smaller than realmin
            % realmin/1e16     | 0             | the number is so small that it cannot be represented in matlab. this results in underflow which gives us zero. 
            % realmax*10       | Inf           | the number is much larger than the biggest number that may be represented, so to show this it returns infinity 
        end

        function s_n = p2(n, choice)
            % This function computes the Archimedes' method for pi.
            % :param n: the number of sides of the polygon
            % :param choice: 1 or 2, the formula to use
            % :return: s_n, the approximation of pi using Archimedes' method.

            % Tabulate the error of |s_n - pi| for n = 0, 1, 2, ..., 15 and choice = 1 and 2.
            % for both choices of formulas.
            % n     | choice 1 | choice 2
            % ------|----------|----------
            % 0     | 0.3225   | 0.3225
            % 1     | 0.0738   | 0.0738
            % 2     | 0.0181   | 0.0181
            % 3     | 0.0045   | 0.0045
            % 4     | 0.0011   | 0.0011
            % 5     |2.8040e-04|2.8040e-04 
            % 6     |7.0093e-05|7.0093e-05
            % 7     |1.7523e-05|1.7523e-05
            % 8     |4.3807e-06|4.3807e-06
            % 9     |1.0952e-06|1.0952e-06 
            % 10    |2.7428e-07|2.7380e-07
            % 11    |7.2033e-08|6.8449e-08
            % 12    |1.8152e-08|1.7112e-08
            % 13    |3.4689e-08|4.2781e-09
            % 14    |1.8152e-08|1.0695e-09 
            % 15    |7.1771e-07|2.6738e-10

            % Explanation of the results (why there is a difference between the two choices):
            % 
            % The second choice has a smaller error than the first choice as n increases.
            % This is because this equation avoids subtraction which means
            % that the cancellation error that the first equation faces is
            % not a probelm for the second equation.
            %
            %
            %
            %
            
            % Write your code here
if choice == 1
    % Use the first formula
    p0 = (1/sqrt(3));
    P = zeros(1, n+1);
    P(1) = p0;
    for i = 1:n 
        P(i+1) = (sqrt(1+P(i)^2)-1)/P(i);
    end
    s_n = 2^n * 6 * P(n+1);
    error = abs(s_n-pi);
else 
    % Use the 2nd formula
    p0 = 1/sqrt(3);
    P = zeros(1, n+1);
    P(1) = p0;
    for i = 1:n
        P(i+1) = P(i)/(1+sqrt(1+P(i)^2));
    end
    s_n = 2^n * 6 * P(n+1);
    error = abs(s_n-pi);
end
    end


        function s = p3(a)
            % This function computes the Kahan summation algorithm.
            % :param a: a vector of numbers
            % :return: summation of the vector a using Kahan summation algorithm
            
            s = 0; 
            c = 0;

            for i = 1:length(a)
                y = a(i) - c;
                t = s + y;
                c = (t - s) - y;
                s = t;
            end
        end

        function p4(a)
            % This function test the performance of Kahan summation algorithm against native sum.
            % :param a: a vector of numbers in double precision.
            % :return: no returns

            % Test this function with a = rand(n, 1) with various size n multiple times. 
            % Summarize your findings below.
            %
            % Findings: 
            % For small numbers, native sum and Kahan sum are very close to
            % each other. As n grows, the differences between the two
            % become more evident. Native sum experiences greater error
            % while Kahan sum satys more accurate.
            %
            %
            %
            
            single_a = single(a); % Convert a to single precision
            s = hw01.p3(a); % Kahan sum of a under double precision (regarded as truth).

            single_Kahan_s = hw01.p3(single_a); % Kahan sum of single_a under single precision.
            single_naive_s = sum(single_a); % Naive sum of single_a under single precision.
   
            disp(['Error of naive sum under single precision: ', num2str(single_naive_s-s)]);
            disp(['Error of Kahan sum under single precision: ', num2str(single_Kahan_s-s)]);
        end

        function s = p5(a)
            % For 6630. 
            % This function computes summation of a vector using pairwise summation.
            % :param a: a vector of numbers
            % :return: the summation of the vector a using pairwise summation algorithm.

            % ! You may need to create a helper function if your code uses recursion.

            % Rewrite the p4 test function to test this summation method.
            % Summarize your findings below.
            %
            % Findings: 
            %
            % I'm not in this section.
            %
            %
            %


            s = inf; % Write your code here. 

        end
    end
end