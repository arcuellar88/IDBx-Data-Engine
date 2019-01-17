#!/bin/sh

# Check storage is properly setup
if [ -z ${KEY_PASSPHRASE} ]; then
  echo "[ERROR] No storage element available"
  exit 1
fi

# Process course data
process_courses() {

  #Step 1. Download DataPackage
  mkdir courses
  aws s3 cp s3://course-data/idbx-`date +%Y-%m-%d -d "yesterday"`.zip courses/.

  #Step 2. Extract DataPackage
  unzip courses/idbx-`date +%Y-%m-%d -d "yesterday"`.zip -d courses/.
  rm courses/*.zip

  #Step 3 Decrypt
  echo ${KEY_PASSPHRASE} | gpg --passphrase-fd 0 --decrypt-files --no-tty courses/idbx-`date +%Y-%m-%d -d "yesterday"`/*.gpg

  find courses/idbx-`date +%Y-%m-%d -d "yesterday"` -name "*.gpg" -print0 | while read -d $'\0' file;
   do
       echo ${KEY_PASSPHRASE} | gpg --passphrase-fd 0 --decrypt-files --no-tty $file > log.txt;
          rm $file;
          filenamesql=${file%.gpg};
          mv $filenamesql courses/;
   done

  sh bulk_sql_load

  # Cleanup
  rm courses/idbx-`date +%Y-%m-%d -d "yesterday"`
  rm courses/*.gpg

}

# Process events
process_events() {

  mkdir events

  # Step 1. Download from AWS S3 edx
  aws s3 cp s3://edx-course-data/idbx/edx/events/idbx-edx-events-`date +%Y-%m-%d -d "yesterday"`.log.gz.gpg events/.

  # Step 2. Decrypt
  echo ${KEY_PASSPHRASE} | gpg --passphrase-fd 0 --decrypt-files --no-tty events/*.gpg

  # Step 3. Decompress
  gzip -d events/*.gz

  # Cleanup
  rm events/*.gz.gpg
}

# Main execution point
FUNC=${1:-sync}
case ${FUNC} in
  "sync")
    # Import key and move to home dir
    gpg --import key.asc

    cd /root

    process_courses

    # process_events

    exit 1
  ;
esac
