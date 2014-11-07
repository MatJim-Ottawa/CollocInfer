function [ output_args ] = C_in( t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
output_args = 2 + ((t>=16).*(t<20) - (t>=20).*(t<24))/5;

end

