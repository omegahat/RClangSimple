PKG_NAME=RCIndex
PKG=$(PKG_NAME)
WEB_DIR=www.omegahat.org:/home3/WebSites/Omega/$(PKG)
#CHANGES=../Changes.html
FAQ=FAQ.html

include $(OMEGA_HOME)/R/Config/RPackageWebConfig

RDB_DOCS=$(wildcard ../tests/*.Rdb)
DOC_FILES=$(RDB_DOCS:%.Rdb=%.html) $(wildcard ../tests/*.R)


include $(OMEGA_HOME)/R/Config/RPackageWebRules




