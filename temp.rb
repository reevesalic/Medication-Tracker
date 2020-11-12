<h4>Reason for medication</h4>
 <%=f.fields_for :illnesses do |i| %>
  <% i.label :illness %>
  <% i.text_field :illness %>
 <% end %>


</div>
<br>