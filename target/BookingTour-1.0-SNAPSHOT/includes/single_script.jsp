<%-- 
    Document   : single_script
    Created on : Jul 4, 2023, 9:34:21 PM
    Author     : DELL
--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://web8802.com/wp-content/themes/hienads/assets/js/quanhuyen.js"></script>
    <script>
                                            // Ki?m tra s? ch? còn tr?ng
                                            var seatCount = ${detail.seat};
                                            if (seatCount === 0) {
                                                // Hi?n th? thông báo "Tour ?ã h?t ch?"
                                                alert("Tour ?ã h?t ch?");
                                            }

    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script>
                                            var citis = document.getElementById("city");
                                            var districts = document.getElementById("district");
                                            var wards = document.getElementById("ward");
                                            var Parameter = {
                                                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                                                method: "GET",
                                                responseType: "application/json",
                                            };
                                            var promise = axios(Parameter);
                                            promise.then(function (result) {
                                                renderCity(result.data);
                                            });

                                            function renderCity(data) {
                                                for (const x of data) {
                                                    citis.options[citis.options.length] = new Option(x.Name, x.Name); // L?u tr? tên thay vì Id
                                                }
                                                citis.onchange = function () {
                                                    district.length = 1;
                                                    ward.length = 1;
                                                    if (this.value != "") {
                                                        const result = data.filter(n => n.Name === this.value); // So sánh v?i tên thay vì Id

                                                        for (const k of result[0].Districts) {
                                                            district.options[district.options.length] = new Option(k.Name, k.Name); // L?u tr? tên thay vì Id
                                                        }
                                                    }
                                                };
                                                district.onchange = function () {
                                                    ward.length = 1;
                                                    const dataCity = data.filter((n) => n.Name === citis.value); // So sánh v?i tên thay vì Id
                                                    if (this.value != "") {
                                                        const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards; // So sánh v?i tên thay vì Id

                                                        for (const w of dataWards) {
                                                            wards.options[wards.options.length] = new Option(w.Name, w.Name); // L?u tr? tên thay vì Id
                                                        }
                                                    }
                                                };
                                            }

    </script>
