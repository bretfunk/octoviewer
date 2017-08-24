<div class="container-fluid">
  <div class="row">
    <div class="col-2">
      <h1><%= current_user.name%></h1>
      <img src="<%= current_user.image_url %>", style="width:150px">
      <br>

      <h2>Account Information</h2>
      <p>Github name: <%= current_user.name %></p>
      <p>Github nickname: <%= current_user.nickname %></p>
      <p>Github email: <%= current_user.email %></p>
      <p>Number of starred repos: <%= User.starred_results(current_user).count %></p>
      <p>Followers: <%= User.user_results(current_user)["followers"] %></p>
      <p>Following: <%= User.user_results(current_user)["following"] %></p>
      <br>
      <h2>Organizations</h2>
      <% User.events_results(current_user).each do |org| %>
        <p><%= org["name"] %></p>
      <% end %>
      <br>
    </div>
    <div class="col-6">
      <h2>Repos</h2>
      <% count = 0 %>
      <div class="panel-body">
        <table class="table table-hover table-striped table-bordered">
          <thead>
            <tr>
              <th>A</th>
              <th>B</th>
              </tr>
                </thead>
                <tbody>
      <% User.repos_results(current_user).each do |repo| %>
        <tr>
          <td>
        <p><%= repo["name"] %></p>
          </td>
          <td>
        <p><a href="<%= repo["owner"]["html_url"] %>">Link to Repo</a></p>
          </td>
        <% count += 1 %>
        <% break unless count < 15 %>
      <% end %>
          </tbody>
        </table>
      </div>
      <br>
    </div>
    <div class="col-4">
      <h2>Recent Activity</h2>
      <div class="panel-body">
        <table class="table table-hover table-striped table-bordered">
          <thead>
            <tr>
              <th>A</th>
              <th>B</th>
              <th>C</th>
              <th>D</th>
            </tr>
          </thead>
          <tbody>
            <tr>
      <% count = 0 %>
      <% @events_results.each do |event| %>
        <td>
        <%= event["actor"]["display_login"] %>
        </td>
        <td>
        <%= event["repo"]["name"] %>
        </td>
        <td>
        <%= event["type"] %>
        </td>
        <td>
        <img src="<%= event['actor']['avatar_url'] %>", style="width: 50px">
        </td>
        <% count += 1 %>
        <% break unless count < 5 %>
      <% end %>
            </tr>
          </tbody>
        </table>
      </div>
      <br>

      <h2>Activity From Users I Follow</h2>
      <% count = 0 %>
      <% @received_events_results.each do |event| %>
        <img src="<%= event['actor']['avatar_url'] %>", style="width: 50px">
        <p><%= event["actor"]["display_login"] %></p>
        <p><%= event["repo"]["name"] %></p>
        <p><%= event["type"] %></p>
        <% count += 1 %>
        <% break unless count < 5 %>
      <% end %>
      <br>

    </div>
  </div>
</div>

