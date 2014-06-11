%%%%%%%%SUBMITTING TESTING CASE ON SMALL NUMBER OF FILES
% j = batch('test2','AttachedFiles','C:\Users\Kailash\Desktop\amazon_try\scripts\','AdditionalPaths','/shared/persisted/NSLtools/','CurrentFolder','.');

%%%%%%%%%SUBMITTING FEATURE EXTRACTION ::: STORE THIS IN \shared\tmp as
%%%%%%%%%this is 230GB+ in size 
% j1 = batch('wrapper_RCW_repeat','AttachedFiles','C:\Users\Kailash\Desktop\amazon_try\scripts\','AdditionalPaths','/shared/persisted/NSLtools/','CurrentFolder','.','matlabpool',31);
j11 = batch('wrapper_RCW_tilt_repeat','AttachedFiles','C:\Users\Kailash\Desktop\amazon_try\scripts\','AdditionalPaths','/shared/persisted/NSLtools/','CurrentFolder','.','matlabpool',31);

%%%%SUBMITTING Feature size reduction and collecting all the features for
%%%%same wavefile into one feature file
% j2 = batch('wrapper_reduce_weight_repeat','AttachedFiles','C:\Users\Kailash\Desktop\amazon_try\scripts\','AdditionalPaths','/shared/persisted/NSLtools/','CurrentFolder','.','matlabpool',31);
j22 = batch('wrapper_reduce_weight_tilt_repeat','AttachedFiles','C:\Users\Kailash\Desktop\amazon_try\scripts\','AdditionalPaths','/shared/persisted/NSLtools/','CurrentFolder','.','matlabpool',31);

%%%%%%%%Submitting gmm_adaptation to get confusion matrix
j3 = batch('wrapper_gmm_adapt_tilt_repeat','AttachedFiles','C:\Users\Kailash\Desktop\amazon_try\scripts\','AdditionalPaths','/shared/persisted/NSLtools/','CurrentFolder','.','matlabpool',31);

%%%%%%%%Submitting Features extraction normal
% j = batch('wrapper_RCW','AttachedFiles','C:\Users\Kailash\Desktop\amazon_try\scripts\','AdditionalPaths','/shared/persisted/NSLtools/','CurrentFolder','.','matlabpool',31);

%%%%SUBMITTING Feature size reduction and collecting all the features for
%%%%same wavefile into one feature file
% j = batch('wrapper_reduce_weight','AttachedFiles','C:\Users\Kailash\Desktop\amazon_try\scripts\','AdditionalPaths','/shared/persisted/NSLtools/','CurrentFolder','.','matlabpool',31);

%%%%%%%%Submitting gmm_adaptation to get confusion matrix
% j = batch('wrapper_gmm_adapt_tilt','AttachedFiles','C:\Users\Kailash\Desktop\amazon_try\scripts\','AdditionalPaths','/shared/persisted/NSLtools/','CurrentFolder','.','matlabpool',31);

%%%%%%%%Submitting Features extraction OPENSMILE
% j = batch('wrapper_opensmile','AttachedFiles','C:\Users\Kailash\Desktop\amazon_try\scripts\','CurrentFolder','.','matlabpool',31);
