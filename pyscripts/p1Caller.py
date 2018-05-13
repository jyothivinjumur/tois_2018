__author__ = 'jyothi'

from ModuleP1 import phase1
import sys
from CostMatrix import cm


def main(argv):
    try:
        p1=phase1()
        wDir= argv[0] # Joint Cost Model's Working Directory (Specific Resp and Priv Cat ,  and) '/Users/jyothi/Documents/Research/jvdofs/rcv1v2/results' #arg[0]
        workDirResponsive=argv[1] # Responsive WD '/Users/jyothi/Documents/Research/jvdofs/rcv1v2/results/C15' #argv[1]
        workDirPrivilege=argv[2]  # Privilege WD '/Users/jyothi/Documents/Research/jvdofs/rcv1v2/results/C17'  # argv[2]
        numTestInstances=argv[3]  # 10000#argv[3]
        cMatrix=cm()
        cMatrix.setCostMatrix(float(argv[4]),float(argv[5]),float(argv[6]),float(argv[7]),float(argv[8]),float(argv[9]))
        cMatrix.setAlpha(float(argv[10]))
        cmv=cMatrix.getCostMatrix()
        p1.classifyDocuments(wDir,workDirResponsive+'/pickleFiles/ds-op-label.tuple.dictionary.'+str(numTestInstances)+'.p',workDirPrivilege+'/pickleFiles/ds-op-label.tuple.dictionary.'+str(numTestInstances)+'.p',numTestInstances,cmv,reclassify=False)
    except:
        raise

if __name__ == "__main__":
    main(sys.argv[1:])