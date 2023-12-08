import sys

filename = sys.argv[1]
with open(filename, 'r') as f:
    data = f.readlines()
result = 'INSERT INTO ' + filename.split('/')[-1].split('.data')[0] + ' VALUES '
for line in data:
    result += '(' + ', '.join(line.strip().split('\t')) + '), '
result = result[:-2] + ';'
print(result)
with open('temp.sql', 'w') as f:
    f.write(result)