-- get the selected items
local numberOfItems = reaper.CountSelectedMediaItems()
local ItemRefrences = {} -- New Array
local timeBetween = 0

-- Get refrences to each selected item
for i=0, numberOfItems-1  do
      ItemRefrences [i] = reaper.GetSelectedMediaItem(0, i)
end

-- check if at least two items are selected
if (numberOfItems < 2) then
    reaper.ShowMessageBox("Please select two items.", "Error", 0)
    return
end

-- get the difference between 2 selected items and then add them to time between
for i=1, numberOfItems - 1 do
    timeBetween = timeBetween + (reaper.GetMediaItemInfo_Value(ItemRefrences [i], "D_POSITION") - reaper.GetMediaItemInfo_Value(ItemRefrences [i-1], "D_POSITION"))
end

-- Calculate the mean time between item
timeBetween = timeBetween / (numberOfItems-1)

-- display the time between the items in seconds
reaper.ShowMessageBox("The time between items: " .. timeBetween .. " seconds.", "Time Between Items", 0)
