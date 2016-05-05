subject - The ID of the test subject activity - The type of activity
performed when the specific measurements were taken

I read the data, extracted mean/stdev using grep/gsub, and used rbind to
merge the two datasets together.

Afterwards, I turned activities and subjects into factors, and joined
the mean.

This resulted in my combined data set.

Labels and Explanations:

WALKING (value 1): experimental subject was walking during the test
WALKING\_UPSTAIRS (value 2): experimental subject was walking up a
staircase during the test WALKING\_DOWNSTAIRS (value 3): experimental
subject was walking down a staircase during the test

SITTING (value 4): subject was sitting during the test STANDING (value
5): subject was standing during the test LAYING (value 6): subject was
laying down during the test
