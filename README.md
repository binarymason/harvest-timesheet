# Harvest Timesheet

This is the result of me being lazy and forgetting to submit my timesheet.
Unfortunately Harvest's API does not support submitting timesheets, so this
script uses the [Watir](http://watir.github.io/) browser.

### Installation

```sh
git clone https://github.com/binarymason/harvest-timesheet.git
```

### Usage

1) First ensure that `submit_last_weeks_timesheet.rb` is executable:

```sh
chmod +x submit_last_weeks_timesheet.rb
```

2)  Set up environment variables.  Do this by copying `.env.sample` to `.env`
    and filling out each variable.

```sh
cp .env.sample .env
```

**Required Environment Variables:**
The script assumes you are using email/password authentication and thus depends
on the following variables.

- **HARVEST_URL**=`https://YOURACCOUNT.harvestapp.com`
- **HARVEST_EMAIL**=`youremail@mail.com`
- **HARVEST_PASSWORD**=`yourpassword`

3)  Run script... maybe schedule it to be run automatically?

```sh
./submit_last_weeks_timesheet.rb
```
