const searchForm = document.getElementById('searchForm');
const oneWayRadio = document.getElementById('oneWayRadio');
const sourceInput = document.getElementById('source');
const destinationInput = document.getElementById('destination');
const sourceList = document.getElementById('sourceList');
const destinationList = document.getElementById('destinationList');
const dateInput = document.getElementById('date');

searchForm.addEventListener('submit', function(event) {
  event.preventDefault();

  if (oneWayRadio.checked) { // Check if one-way trip is selected
    const source = sourceInput.value;
    const destination = destinationInput.value;
    const date = dateInput.value;

    if (!isLocationValid(source, sourceList) || !isLocationValid(destination, destinationList)) {
      alert('Please select a valid location from the list.');
      return;
    }

    // Display hardcoded details for one-way trip
    displayOneWayDetails(source, destination, date);
  }
});

function isLocationValid(location, dataList) {
  const options = Array.from(dataList.options).map(option => option.value.toLowerCase());
  return options.includes(location.toLowerCase());
}

function displayOneWayDetails(source, destination, date) {
  // Hardcoded details for one-way trip
  const details = {
    departureTime: '5:00 PM',
    source: source, // Use the source passed from the search form
    destination: 'Rockford',
    busNumber: 'Bus004'
  };

  // Construct the details string
  const detailsString = `Departure Time: ${details.departureTime} | Source: ${details.source} | Destination: ${details.destination} | Bus Number: ${details.busNumber}`;

  // Redirect to a new page with the details
  const queryString = `?source=${source}&destination=${destination}&date=${date}&details=${encodeURIComponent(detailsString)}`;
  window.location.href = `details.html${queryString}`;
}
