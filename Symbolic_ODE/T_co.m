function [ output_args ] = T_co( t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
output_args = 335 + ((t>=40).*(t<44) - (t>=44).*(t<48))*5;

end


