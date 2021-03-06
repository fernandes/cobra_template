#!/usr/bin/env bash
# copy_template.sh
#
# Based on suggestion made on @benjaminleesmith's talk
# http://confreaks.com/videos/2646-rockymountainruby2013-how-i-architected-my-big-rails-app-for-success

# Must enter a name
[ -z $1 ] && echo "You must use $0 <new_component_name> <component_template>" && exit 1
component_name=$1
template_name=$2

# Let use default default or another one?

if [ -z $2 ]; then
  template_name='template_component'
else
  # is the name entered valid?
  echo $template_name|egrep -q "^[a-z][a-z\_]+[a-z]$"
  [ $? -ne 0 ] && echo "Invalid template name use something like new_name" && exit 1
  
  # is there a folder for it?
  [ ! -d $template_name ] && echo "There is not template folder with this name" && exit 1
fi

# Must be a valid name
echo $component_name|egrep -q "^[a-z][a-z\_]+[a-z]$"
[ $? -ne 0 ] && echo "Invalid component name use something like new_name" && exit 1

# Came Case
component_name_camel=`awk '{ print toupper(substr($0, 1, 1)) substr($0, 2) }' <<< "$component_name"`
component_name_camel=`awk -F _ '{printf "%s", $1; for(i=2; i<=NF; i++) printf "%s", toupper(substr($i,1,1)) substr($i, 2); print"";}' <<< "$component_name_camel"`

# Copy template
cp -pr $template_name $component_name
cd $component_name

# Move files
for file in $(find . -name "*component_template*"); do
  mv $file `echo $file | sed s/component_template/$component_name/`
done

# Replace Component Name
for file in $(find . -type f); do
  sed -i '' "s/component_template/$component_name/g" $file
  sed -i '' "s/ComponentTemplate/$component_name_camel/g" $file
done
