function [ output_args ] = F_in( t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
output_args = 1 + ((t>=3).*(t<8) - (t>=8).*(t<12))/2;

end

