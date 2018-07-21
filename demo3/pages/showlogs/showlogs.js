// pages/showlogs/showlogs.js
//@作者 程乐
Page({

  /**
   * 页面的初始数据
   */
  data: {
    entity:'',
    id:'',
    loglist:[]
  
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this;
    that.setData({
      id:options.id
    })
    wx.request({
      url: 'http://localhost:8080/getJson?entity=user&id='+this.data.id,
      method:'GET',
      success:function(res){
        var result=res.data;
        that.setData({
          loglist:res.data.logList
        })

      }
    })
  
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  },
  subForm:function(e){
    var that = this;
    var log = e.detail.value.logcontent;
    wx.request({
      url: 'http://localhost:8080/getJson?entity=add&log=' + log+'&logType=user&id='+that.data.id,
      method:'POST',
      success:function(res){
        wx.redirectTo({
          url: '../showuser/showuser?id='+that.data.id,
        })
      }
    })
  }
})