function [ output_args ] = T_in( t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
output_args = 200 + ((t>=28).*(t<32) - (t>=32).*(t<36))*25;

end



