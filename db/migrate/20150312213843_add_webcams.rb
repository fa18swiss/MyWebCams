class AddWebcams < ActiveRecord::Migration
  def up
    Webcam.create([
      {nom: "LGCS east", url:"http://www.leseplaturesairport.ch/site/images/stories/webcam/LSGC1.jpg", latitude:47.084820, longitude:6.796219},
      {nom: "LGCS west", url:"http://www.leseplaturesairport.ch/site/images/stories/webcam/LSGC3.jpg", latitude:47.084820, longitude:6.796219},
  
    ])
  end
end
