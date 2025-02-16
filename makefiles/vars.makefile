#################
## These years exist as zip files originally
ZIPYEARS = 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014
ZIP_CSVNAMES = $(addsuffix .csv, $(addprefix data/stashed/nypd/csv/, $(ZIPYEARS)))
ZIP_FILENAMES = $(addsuffix .zip, $(addprefix data/stashed/nypd/zip/, $(ZIPYEARS)))


#################
## These years already exist as CSVs originally
CSVYEARS = 2015 2016
CSV_FILENAMES = $(addsuffix .csv, $(addprefix data/stashed/nypd/csv/, $(CSVYEARS)))

#################
## These years exist as xlsx files originally
XLSXYEARS = 2017 2018
XLSX_FILENAMES = $(addsuffix .xlsx, $(addprefix data/stashed/nypd/xlsx/, $(XLSXYEARS)))
XLSX_CSVNAMES = $(addsuffix .csv, $(addprefix data/stashed/nypd/csv/, $(XLSXYEARS)))

ALL_FILES = $(ZIP_FILENAMES) $(CSV_FILENAMES) $(XLSX_FILENAMES)
ALL_CSVS = $(ZIP_CSVNAMES) $(CSV_FILENAMES) $(XLSX_CSVNAMES)

$(ALL_FILES) :
	# the fetching process
	./src/stash/fetch_files.py $(notdir $@)

$(ZIP_CSVNAMES) $(XLSX_CSVNAMES):
	# these files require extraction process
	./src/stash/extract_csvs.py $(notdir $@)




# these are manually enumerated because I don't know how to do other wise
# https://stackoverflow.com/questions/11441084/makefile-with-multiples-rules-sharing-same-recipe
data/stashed/nypd/csv/2003.csv : data/stashed/nypd/zip/2003.zip
data/stashed/nypd/csv/2004.csv : data/stashed/nypd/zip/2004.zip
data/stashed/nypd/csv/2005.csv : data/stashed/nypd/zip/2005.zip
data/stashed/nypd/csv/2006.csv : data/stashed/nypd/zip/2006.zip
data/stashed/nypd/csv/2007.csv : data/stashed/nypd/zip/2007.zip
data/stashed/nypd/csv/2008.csv : data/stashed/nypd/zip/2008.zip
data/stashed/nypd/csv/2009.csv : data/stashed/nypd/zip/2009.zip
data/stashed/nypd/csv/2010.csv : data/stashed/nypd/zip/2010.zip
data/stashed/nypd/csv/2011.csv : data/stashed/nypd/zip/2011.zip
data/stashed/nypd/csv/2012.csv : data/stashed/nypd/zip/2012.zip
data/stashed/nypd/csv/2013.csv : data/stashed/nypd/zip/2013.zip
data/stashed/nypd/csv/2014.csv : data/stashed/nypd/zip/2014.zip

data/stashed/nypd/csv/2017.csv : data/stashed/nypd/xlsx/2017.xlsx
data/stashed/nypd/csv/2018.csv : data/stashed/nypd/xlsx/2018.xlsx
