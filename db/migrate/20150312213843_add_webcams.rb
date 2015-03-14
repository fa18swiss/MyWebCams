class AddWebcams < ActiveRecord::Migration
  def up
    Webcam.create([
      {nom: "LSGC east", url:"http://www.leseplaturesairport.ch/site/images/stories/webcam/LSGC1.jpg", latitude:47.084820, longitude:6.796219, orientation:60},
      {nom: "LSGC west", url:"http://www.leseplaturesairport.ch/site/images/stories/webcam/LSGC3.jpg", latitude:47.084820, longitude:6.796219, orientation:240},
      {nom: "LSGN east", url:"http://www.neuchatel-airport.ch/webcams/lsgn_east.jpg", latitude:46.959773, longitude:6.864211},
      {nom: "LSGN west", url:"http://www.neuchatel-airport.ch/webcams/lsgn_west.jpg", latitude:46.959773, longitude:6.864211}
    ])
  end
end
