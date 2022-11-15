function X = readDataFile(name)
data=fopen(name);
k=1;
data_line = fgetl(data);
while ischar(data_line)
    X(k,:) = str2num(data_line);
    data_line = fgetl(data);
    k=k+1;
end

end