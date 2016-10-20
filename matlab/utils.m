%%
%% File:    utils.m
%%
%% Author:  Schuyler Martin <sam8050@rit.edu>
%%
%% Description: Contains common utility functions
%%

%%
%% MATLAB class definition that provides common utility functions and common
%% constant global definitions
%%
classdef utils
    %%%%%%%%%% Global Constants %%%%%%%%%%
    %% MATLAB has no easy way to make constant globals (i.e. C Macros) so this
    %% is the closest thing I could come up with and has some write protection
    properties (Constant)
        % debug "macro", enables helpful debugging output when set to true
        DEBUG_MACRO = false;
    end

    %%%%%%%%%% BEGIN: Static Utility Functions %%%%%%%%%%
    methods (Static = true)
        %%
        %% Converts RBG image into LAB, normalized; values between 0 and 1
        %%
        %% @param img_in Input RGB image
        %% @param img_out Output normalized LAB image
        %%
        function img_out = rgb2lab_norm(img_in)
            img_out = rgb2lab(img_in);
            % normalize lab as per in-class example
            img_out(:,:,1) = img_out(:,:,1)./100.0;   
            a_star_min = -100;
            a_star_max =  100;
            img_out(:,:,2) = (img_out(:,:,2) - a_star_min) /...
                (a_star_max - a_star_min);
            b_star_min = -100;
            b_star_max =  100;
            img_out(:,:,3) = (img_out(:,:,3) - b_star_min) /...
                 (b_star_max - b_star_min);
        end
    end
    %%%%%%%%%% END: Static Utility Functions %%%%%%%%%%
end
