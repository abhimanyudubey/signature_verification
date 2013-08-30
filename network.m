function net = init_network(n);
net = network;                                  % create network
net.numInputs = n;                              % set number of inputs
net.inputs{1}.size = 1;                         % assign 2 to input size
net.inputs{2}.size = 1;
net.numLayers = 1;                              % add 1 layer to network
net.layers{1}.size = 1;                         % assign number of neurons in layer
net.inputConnect(1) = 1;                        % connet input to layer 1
net.inputConnect(2) = 1;
net.biasConnect(1) = 1;                         % connect bias to layer 1
net.biases{1}.learnFcn = 'learnp';              % set bias learning function
net.biases{1}.initFcn = 'initzero';             % set bias init function
 
net.outputConnect(1) = 1;
 
net.layers{1}.transferFcn = 'hardlim';          % set layer transfer function [hard limit]
net.inputWeights{1}.initFcn = 'initzero';       % set input wieghts init function
net.inputWeights{1}.learnFcn = 'learnp';        % set input weight learning function
net.inputWeights{2}.learnFcn = 'learnp';
net.inputWeights{2}.initFcn = 'initzero';
 
net.initFcn = 'initlay';                        % set network init function
net.trainFcn = 'trainc';                        % set network training function
net.performFcn = 'mae';                         % set network perf evaluation function
 
view(net)
net = train(net,[0 0 1 1;0 1 0 1],[0 0 0 1]) ;  % train network
end