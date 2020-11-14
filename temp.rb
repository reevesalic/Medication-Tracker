
   <%# <%= f.label :name, "Medication Name" %> %>
   <%# <%= f.collection_select :medication_id, Medication.all, :id, :name, prompt: true%> %>
 <div> 
 <h3>To add a medication for the patient, select a medication from the drop down or create a new one</h3>
   <%= f.fields_for :medications_attributes do |m| %>
     

 <h4>Create a new medication</h4>
 
     <%= m.label :name %>
     <%= m.text_field :name %>
     <br><br>
     <%= m.label :quantity %>
     <%= m.number_field :quantity %>
     <br>
     <br>
     <%= m.label :frequency %>
     <%= m.number_field :frequency %>

</div>
<br>