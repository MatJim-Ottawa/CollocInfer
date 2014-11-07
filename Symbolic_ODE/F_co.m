function [ output_args ] = F_co( t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
output_args = 0.3 + ((t>=52).*(t<56) - (t>=56).*(t<60))*0.1;

end



