import sys
import re
from os.path import expanduser

JIRA_PATH_CORRESPONDENCE = {"DRVINET":    expanduser("~") + "/driiiiiiiiiiiiiiiiiiiivers/inetdriver/",
                            "OMSRBT":     expanduser("~") + "/oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooms/oms-trade-robot",
                            "VTGTWY":     expanduser("~") + "/inntech/desarrollo/gateway/vtgateway",
                            "OMSTRD":     expanduser("~") + "/oms/oms-suuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuper-largo/oms-trd",
                            "DRVALLFNDS":     expanduser("~") + "/driiiiiiiiiiiiiiiiiiiivers/allfundsdriver",
                            "VTFIXBRDG":  expanduser("~") + "/inntech/desarrollo/gateway/fixbridge",
                            "OMSCLIP":  expanduser("~") + "/oms/Clipsy",
                            "OMSMILF":  expanduser("~") + "/oms/oms-milf",
                            "CMNFLSVT":  expanduser("~") + "/inntech/desarrollo/vtcommon/vtcommon-files",
                            "VTIMM":  expanduser("~") + "/inntech/desarrollo/gateway/IMMBackoffice",
                            "STID":  expanduser("~") + "/driiiiiiiiiiiiiiiiiiiivers/sixfixdriver",
                            "OMSCLIP":  expanduser("~") + "/oms/Cliiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiipsy",
                            "DRVSMR":  expanduser("~") + "/driiiiiiiiiiiiiiiiiiiivers/smxdriver",
                            "VTFOEDISP":  expanduser("~") + "/inntech/desarrollo/foe/foedispatcher",
                            "VTFOEGATE":  expanduser("~") + "/inntech/desarrollo/foe/foegate"}

def remove_code(JIRA):
    return re.sub(r'-[0-9]*', '', JIRA)

def find_project_path_with_JIRA(JIRA):
    return JIRA_PATH_CORRESPONDENCE[remove_code(JIRA)]

if __name__ == "__main__":
    sys.stdout.write("%s\n" % (find_project_path_with_JIRA(sys.argv[1])))
