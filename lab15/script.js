$(document).ready(function() {

    var attractions = {
        zoo: {
            name: "Амьтны хүрээлэн",
            schedule: "Өдөр бүр 9-ээс 18 хүртэл нээлттэй",
            timeline: [
                "9:00 - 12:00: Амьтдыг тэжээх",
                "13:00 - 15:00: Амьтдын тоглолт",
                "16:00 - 18:00: Цэцэрлэгийн аялал"
            ]
        },
        theater: {
            name: "Театр",
            schedule: "Бямба, ням гарагт 14:00, 19:00 цагт тоглолт",
            timeline: [
                "14:00: Өдрийн тоглолт",
                "19:00: Оройн тоглолт"
            ]
        },
        museum: {
            name: "Музей",
            schedule: "Мягмар - Ням гариг, 10:00-17:00 хүртэл нээлттэй",
            timeline: [
                "10:00 - 13:00: Байнгын үзэсгэлэн",
                "14:00 - 17:00: Солилцох үзэсгэлэн"
            ]
        }
    };

 
    $(".attraction-marker").hover(
        function() {
            var attraction = $(this).data("attraction");
            $(this).find(".animated-images ." + attraction + "-icon").show();
            $(this).find(".attraction-name").text(attractions[attraction].name);
            $(this).find(".attraction-schedule").text(attractions[attraction].schedule);


            var $timelineElement = $(this).find(".attraction-timeline");
            $timelineElement.empty();
            $.each(attractions[attraction].timeline, function(index, timelineItem) {
                $timelineElement.append("<p>" + timelineItem + "</p>");
            });

            $(this).find(".attraction-info").show();

            $(this).addClass("animate");
            setTimeout(function() {
                $(".attraction-marker.animate").removeClass("animate");
            }, 1000);
        },
        function() {
            $(this).find(".attraction-info").hide();
            $(this).find(".animated-images img").hide();
        }
    );
});
