df <- data.frame(
  Patient_ID = c("84862001","8490014","8510726","8510653","8510854","8511133"),
  Diagnosis = c("M","M","B","B","B","M"),
  Radius_Mean = c(16.13,19.81,14.36,15.71,12.44,14.26),
  Texture_Mean = c(20.68,22.15,14.36,15.71,12.44,14.26),
  Perimeter_Mean = c(108.1,130,87.46,85.63,60.34,102.5)
)
print(df)
print(summary(df))

#question 1