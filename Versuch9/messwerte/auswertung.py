#!/usr/bin/python3

import csv,array,sys

def histogram(csvFileName):
    print('histogram:\t'+csvFileName, file=sys.stderr)
    print()
    with open(csvFileName, 'rt') as csvFile:
        # v means values
        vReader = csv.reader(csvFile, delimiter=' ')
        vValues = array.array('I')
        vTimes = array.array('L')
        for value in vReader:
            iValue = int(value[0]) - 40000
            if iValue >= 0:
                iTime = int(value[1])
                if len(vTimes) > 0:
                    # compensate for not recorded seconds by assuming 0 counts
                    for missingTime in range(vTimes[-1] + 1, iTime):
                        vValues.append(0)
                        vTimes.append(missingTime)
# for the curious
#                        print('mis:\t'+str(missingTime), file=sys.stderr)
                vValues.append(iValue)
                vTimes.append(iTime)
                   # here be bin sizes!
        for bin in [1, 2, 5, 10]:
            vBinned = array.array('I')
            for i in range(len(vValues) // bin):
                vBinned.append(0)
                for j in range(bin):
                    vBinned[i]+=vValues[i+j]
            with open('histo'+str(bin)+'s'+csvFileName, 'wt') as outFile:
                for v in range(max(vBinned)+1):
                    print('%(value)i %(count)i' % {'value': v, 'count': vBinned.count(v)}, file=outFile)
                outFile.flush()
                outFile.close()
                print(str(bin)+'s:\t'+str(len(vBinned)), file=sys.stderr)
        csvFile.close()
        print()

def lifetime(csvFileName):
    with open(csvFileName, 'rt') as csvFile:
        # v means values
        vReader = csv.reader(csvFile, delimiter=' ')
        vValues = array.array('I')
        for value in vReader:
            iValue = int(value[0])
            if iValue < 40000:
                vValues.append(iValue)
        vMax = max(vValues)
        # if you want other bin widths, go ahead
        for bin in [10, 20, 50, 100, 1000]:
            vBinned = array.array('I')
            for i in range(0, vMax, bin):
                vBinned.append(0)
                for v in vValues:
                    if v >= i and v < i+bin:
                        vBinned[-1]+=1
            with open('lifeh'+str(bin)+'s'+csvFileName, 'wt') as outFile:
                for i in range(0, vMax, bin):
                    print('%(value)i %(count)i' % {'value': i, 'count': vBinned[i // bin]}, file=outFile)
                outFile.flush()
                outFile.close()
                
histogram('14-12-16-14-09.data')
histogram('14-12-16-15-25.data')
histogram('14-12-17-14-04.data')
lifetime('14-12-16-15-25.data')
lifetime('14-12-17-14-04.data')
