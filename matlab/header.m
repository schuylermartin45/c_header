%%
%% File:    TODO.m
%%
%% Author:  Schuyler Martin <sam8050@rit.edu>
%%
%% Description: TODO
%%

%%
%% Main test driver program
%%
function main_TODO()
    % TODO pathing to image directories
    addpath( '../');

    test_files = { ...
        'TODO.jpg', ...
    };
    % fun with function pointers
    test_prefix = 'TODO_FUNC_';
    parts = { ...
        '1', ...
        '2', ...
    };
    % array indicating file index range for images to test
    % (i.e. parts_files(2, 1) speficies the starting index of Part 2)
    parts_files = [
        1, 1; ...
        1, 1; ...
    ];

    % run all parts for all appropriate files
    for part_idx=1:length(parts)
        % Part <part_idx>
        part_name = strcat(test_prefix, parts{part_idx})
        disp(strcat('========== ', part_name, ' =========='));
        func = str2func(part_name);
        for i=parts_files(part_idx, 1):parts_files(part_idx, 2)
            disp(sprintf('File: %s', test_files{i}));
            img_out = func(test_files{i});

            % display
            ttl = strcat(part_name, ': ', test_files{i});
            figure('Name', ttl, 'NumberTitle', 'off');
            imshow(img_out);
        end
        % pause and move on to the next part
        disp('Press enter to continue...');
        pause();
        close all;
    end
end
